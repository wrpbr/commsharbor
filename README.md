# CommsHarbor

> Transactional e-mail and permission-based campaigns, with the audit trail. Invite-only today.

**Live:** https://commsharbor.com · **API index:** https://commsharbor.com/api/ · **OpenAPI:** https://commsharbor.com/openapi.json · **MCP server:** https://commsharbor.com/mcp · **Docs for agents:** https://commsharbor.com/llms.txt

## What it does

CommsHarbor is the part of an e-mail stack that products usually rebuild badly: sending with proof.

What works today: transactional sends with idempotency keys, tracking and dead-letter replay; campaigns with consent and suppressions enforced on the send path; sending domains verified in SES and DNS; organizations with roles, scoped API keys, webhooks signed with HMAC-SHA256, an append-only audit log and a CRM for the tenant. What is closed: live checkout (the US$ 15 pass and the US$ 10 top-up answer 402 and charge nothing), a cap of 1,000 real recipients a month, nothing renews.

## Quickstart (no account)

Self-described API index:

```bash
curl -s https://commsharbor.com/api/
```

Remote MCP server card (transport, protocol, tool count):

```bash
curl -s https://commsharbor.com/mcp
```

Liveness and deployed commit:

```bash
curl -s https://commsharbor.com/api/health
```

## MCP server (remote, nothing to install)

Streamable HTTP over the same public API. Every tool is a call on this API; `operationId` in the OpenAPI is the tool name. Server card: `GET https://commsharbor.com/mcp`.

Claude Code:

```bash
claude mcp add --transport http commsharbor https://commsharbor.com/mcp
```

Cursor (`.cursor/mcp.json`):

```json
{
  "mcpServers": {
    "commsharbor": {
      "url": "https://commsharbor.com/mcp"
    }
  }
}
```

Main tools: `commsharbor_domains`, `commsharbor_domain_verify`, `commsharbor_domain_deliveries`, `commsharbor_delivery_get`, `commsharbor_crm_contacts_list`, `commsharbor_audit`, `commsharbor_api_key_create`.

## Pricing

**Free.** A 30-day organization trial per verified owner and sending domain: one domain, 1,000 contacts, 5,000 sends, webhooks, API keys and the audit trail. Sign in with an e-mail code, or write to contato@commsharbor.com with your domain.

**Paid.** Checkout is closed during the bootstrap: the US$ 15 pass and the US$ 10 top-up answer 402 and charge nothing.

## What it is not

Not a newsletter tool for purchased lists: permission-based sending is a term of use, not a setting.

## Files in this repository

| | |
|---|---|
| `README.md` | this page |
| `openapi.json` | OpenAPI 3 document; `operationId` = MCP tool name |
| `llms.txt` | short guide for agents (endpoints, auth, pricing, MCP) |
| `llms-full.txt` | full reference: params, body, response field by field, errors (when published) |
| `apis.json` | APIs.json index (APIs.io) |
| `mcp/server.json` | manifest published in the Official MCP Registry (`com.commsharbor/commsharbor`) |
| `okf/` | OKF bundle: markdown with front-matter (index, about, API, FAQ) |
| `examples/` | `curl.sh` and `python.py` with the free calls above |

## About this repository

This repository mirrors the public, machine-readable surfaces of CommsHarbor as served at https://commsharbor.com: the OpenAPI document, the `llms.txt` guide, the MCP registry manifest, the OKF bundle and the APIs.json index. The product itself is not open source; the mirror exists so the API and the MCP server can be found, read and linked from here. Files are regenerated from the live surfaces (last sync: 2026-09-05); if something here disagrees with the site, the site is right.

Issues and suggestions are welcome here. Contact: contato@commsharbor.com. Author: Wendel ([@wrpbr](https://github.com/wrpbr)).
