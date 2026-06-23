# Timber + Rust — Grand Opening Giveaway

A single-page entry app for the grand-opening giveaway and email list.
Works three ways — in-store kiosk tablet, QR code, and the website — and every
entry lands in one Supabase table.

## What's here
- `index.html` — the whole app (entry form, kiosk mode, owner panel, QR generator).
- `supabase/migration.sql` — the database table + security rule (already applied).

## How it stores entries
The page writes each entry straight to Supabase using the project's **publishable
key**, which is safe to ship in the page. A row-level-security rule lets anyone
**submit** an entry but lets **no one read the list** with that key — you read and
export it from the Supabase dashboard. A local backup copy is also kept on the
device that submitted, as a safety net.

- Project: `ieinauaciyieadrbhjnr`
- Table: `public.timber_rust_entries`
- Master list / export: https://supabase.com/dashboard/project/ieinauaciyieadrbhjnr/editor

## Deploy to Vercel (via GitHub)
1. Create a new GitHub repo and add these files (`index.html`, `README.md`, `supabase/`).
2. In Vercel: **Add New → Project → Import** the repo.
3. Framework preset: **Other** (it's a static site — no build step). Click **Deploy**.
4. Vercel gives you a URL like `timber-rust-giveaway.vercel.app`. To use your own
   domain, add `timber-rust.com` (or `win.timber-rust.com`) in Vercel → **Domains**.

Every push to the repo redeploys automatically.

## The QR code
Open the owner panel (tap the footer 5×, PIN **1224**), put the live Vercel/domain
URL in the QR field, generate, and download the PNG for your signage.

## Kiosk tablet
Open the live URL on the tablet with `?kiosk` on the end
(e.g. `https://timber-rust.com/?kiosk`) so those entries are tagged `kiosk`
instead of `web`. Everything still saves to the same Supabase table.

## Getting entries into your email tool
From the Supabase table editor you can export the list to CSV anytime, or set up a
sync to Mailchimp / your email platform. Ask and we can wire an automatic sync.

## Changing wording, prize, colors
All editable copy (prize line, tagline, positioning) is in the owner panel, or
directly in `index.html`.
