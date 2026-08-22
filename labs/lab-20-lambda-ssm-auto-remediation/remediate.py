import json
import os
import boto3

ssm = boto3.client("ssm")
sns = boto3.client("sns")

RUNBOOK_NAME = os.environ.get("RUNBOOK_NAME", "devops-restart-instance")
TOPIC_ARN = os.environ.get("TOPIC_ARN")


def handler(event, context):
    # Auto-remediate an unhealthy/stopped EC2 instance by starting an SSM
    # Automation runbook. The Lambda role is least-privilege: it can start ONLY
    # this runbook and restart ONLY instances tagged devops:remediate=true.
    print("Received event:", json.dumps(event))

    detail = event.get("detail", {})
    instance_id = detail.get("instance-id") or detail.get("InstanceId")
    state = detail.get("state")

    if not instance_id:
        print("No instance id in event; nothing to remediate.")
        return {"status": "no-op", "reason": "missing instance-id"}

    if state not in ("stopped", "stopping"):
        print(f"Instance {instance_id} is '{state}'; no remediation needed.")
        return {"status": "no-op", "instance": instance_id, "state": state}

    resp = ssm.start_automation_execution(
        DocumentName=RUNBOOK_NAME,
        Parameters={"InstanceId": [instance_id]},
    )
    exec_id = resp["AutomationExecutionId"]
    print(f"Started SSM automation execution {exec_id} for {instance_id}")

    if TOPIC_ARN:
        sns.publish(
            TopicArn=TOPIC_ARN,
            Subject="Auto-remediation started",
            Message=(
                f"Instance {instance_id} was {state}. "
                f"Started SSM runbook {RUNBOOK_NAME} (execution {exec_id})."
            ),
        )

    return {
        "status": "remediating",
        "instance": instance_id,
        "execution": exec_id,
    }
