#!/usr/bin/env python3
"""Tiny structured logger that writes request lines to /var/log/app/app.log.
Use it to seed sample traffic so the Logs Insights queries have data to analyse.
Run: sudo python3 app-logger.py 50
"""
import datetime
import random
import sys

LOG_PATH = "/var/log/app/app.log"
PATHS = ["/", "/login", "/api/orders", "/api/search", "/checkout"]


def main(n: int) -> None:
    with open(LOG_PATH, "a", encoding="utf-8") as fh:
        for _ in range(n):
            path = random.choice(PATHS)
            latency = random.randint(30, 400)
            level = "ERROR" if latency > 300 else "INFO"
            status = 500 if level == "ERROR" else 200
            ts = datetime.datetime.utcnow().strftime("%Y-%m-%dT%H:%M:%S")
            fh.write(
                f"{ts} level={level} path={path} status={status} latency_ms={latency}\n"
            )
    print(f"wrote {n} request lines to {LOG_PATH}")


if __name__ == "__main__":
    main(int(sys.argv[1]) if len(sys.argv) > 1 else 50)
