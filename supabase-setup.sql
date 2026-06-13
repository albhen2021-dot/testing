-- Run this in Supabase SQL editor

create table entries (
  id uuid primary key default gen_random_uuid(),
  ign text not null,
  tiktok text not null,
  remarks text,
  created_at timestamptz default now()
);

-- Enable Row Level Security
alter table entries enable row level security;

-- Allow anyone (anon key) to read and write
-- (tighten this later if you need auth-based restrictions)
create policy "Allow public read" on entries
  for select using (true);

create policy "Allow public insert" on entries
  for insert with check (true);

alter table login enable row level security;

create policy "Allow public read" on login
  for select using (true);
