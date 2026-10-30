---
name: commsharbor
description: Inspect domain email setup and authorized email workspaces with CommsHarbor.
license: MIT-0
---

# CommsHarbor

Connect to `https://commsharbor.com/mcp` with Streamable HTTP for free and paid API services.
The directory connector at `https://commsharbor.com/mcp?checkout=site` leaves purchases to the person.
Read `https://commsharbor.com/llms.txt` for the current API contract.

## MCP tools

| Tool | Use |
|---|---|
| `commsharbor_email_workspace` | Read an authorized organization's workspace. |
| `commsharbor_email_domain_setup` | Find an existing domain and the organization that you can open. |
| `commsharbor_email_security_check` | Check SPF, DKIM, DMARC, MX, MTA-STS and BIMI of any domain, free and without an account. |
| `commsharbor_brazil_email_report` | Read the monthly totals of DMARC and SPF in Brazilian governments, banks and listed companies. |

## Use

Use the person's organization ID and an authorized organization API key for private operations.
Keep keys in the client's secret storage. Do not expose keys or mailbox passwords in answers.
Before a write, confirm the intended domain, mailbox or alias and the person's authority.
Public email-security checks have a free allowance. `get_api_x402_email_check` offers a paid check without an account.
Read `pricing` and `billing` for current services, limits and payment availability.
Monthly mailbox packages require the person's account and subscription consent on the site.
For an authorized direct MCP x402 call, use `params._meta["x402/payment"]`; HTTP uses `PAYMENT-SIGNATURE`.
Prepaid credit uses `Authorization: Bearer cred_…` or `X-Credito`. Never spend without authority and a budget.
Pix and card are completed on the site when offered. ChatGPT mode uses existing rights without offering purchases.
Do not offer campaign or transactional sending tools.
