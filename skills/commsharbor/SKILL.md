---
name: commsharbor
description: Inspect domain email setup and authorized email workspaces with CommsHarbor.
license: MIT-0
---

# CommsHarbor

Connect to `https://commsharbor.com/mcp?checkout=site` with Streamable HTTP.
Read `https://commsharbor.com/llms.txt` for the current API contract.

## MCP tools

| Tool | Use |
|---|---|
| `commsharbor_email_plans` | Read public plans and storage allowances. |
| `commsharbor_email_workspace` | Read an authorized organization's workspace. |
| `commsharbor_email_domain_setup` | Check a domain before purchase without creating a charge. |

## Use

Use the person's organization ID and an authorized organization API key for private operations.
Keep keys in the client's secret storage. Do not expose keys or mailbox passwords in answers.
Before a write, confirm the intended domain, mailbox or alias and the person's authority.
If payment is required, direct the person to the website. Do not offer campaign or transactional sending tools.
