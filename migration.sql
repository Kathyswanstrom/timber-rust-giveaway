-- Timber + Rust giveaway entries
-- Run once in Supabase (already applied to project ieinauaciyieadrbhjnr).

create table if not exists public.timber_rust_entries (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  name text not null,
  email text not null,
  phone text,
  interest text,          -- 'yes' | 'maybe' | 'no'
  dream text,
  consent boolean not null default false,
  source text not null default 'web'   -- 'web' | 'kiosk'
);

create index if not exists timber_rust_entries_created_at_idx
  on public.timber_rust_entries (created_at desc);

alter table public.timber_rust_entries enable row level security;

-- Anyone may SUBMIT an entry; nobody may read/edit/delete via the public key.
-- (You read/export the list from the Supabase dashboard, which bypasses RLS.)
drop policy if exists "anon can insert entries" on public.timber_rust_entries;
create policy "anon can insert entries"
  on public.timber_rust_entries
  for insert
  to anon, authenticated
  with check (true);
