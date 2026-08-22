# Branching workflow (trunk-based)

We practise **trunk-based development** on this repository.

## Rules
1. `main` is the trunk and is always releasable.
2. `main` is **protected**: no direct pushes; every change lands via a Pull Request
   with at least one approving review.
3. Feature branches are **short-lived** and named `feature/<short-topic>`,
   `fix/<short-topic>` or `chore/<short-topic>`.
4. Rebase or fast-forward onto the latest `main` before opening the PR.
5. CI (CodeBuild) must be green before the PR can merge.

## Everyday loop
```bash
git checkout main && git pull --ff-only
git checkout -b feature/my-change
# ... edit, then ...
git commit -am "feat: my change"
git push -u origin feature/my-change
# open a PR into main, get a review, merge
```

## Source integration
The repository is connected to AWS through an **AWS CodeConnections** connection
(`devops-github`). Pipelines use that connection as their Source action, so a merge
to `main` triggers the build/deploy pipeline automatically.
