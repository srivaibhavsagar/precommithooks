# precommithooks
Hook Type  When It Runs  Use Case

pre-commit Before the commit is created Linting, formatting, tests, etc.

commit-msg After commit message is entered  Validate commit message format

pre-push  Before a push to remote  Run tests or validate branch naming

post-commit  After a commit is created  Notifications, logging, etc.



---

### 🧠 Why isn't it automatic?

Git **does not version-control the `.git/hooks/` folder**, so hook scripts aren't carried over when someone clones a repo.

That's why they must manually install hooks using `pre-commit install`.

---

## ✅ Summary for Users Who Clone Your Repo

| Step | Command | Purpose |
|------|---------|---------|
| 1 | `pip install pre-commit` | Install the pre-commit framework |
| 2 | `pre-commit install --hook-type commit-msg` | Install the commit-msg hook |
| 3 | `pre-commit install` | (Optional) Install standard pre-commit hooks |
| 4 | `pre-commit run --all-files` | (Optional) Run all hooks manually |

---

Let me know if you want to **enforce it in CI/CD**, or **auto-check it in PRs** too!
