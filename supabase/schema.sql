-- MINDS - Theory · Supabase schema v0.1
-- Run in Supabase SQL Editor after creating the project.

create extension if not exists pgcrypto;
create extension if not exists vector;

create table if not exists public.documents (
  user_id uuid not null references auth.users(id) on delete cascade,
  id text not null,
  kind text not null default 'reading',
  title text not null,
  author text,
  role text,
  source_date date,
  content text not null,
  partial boolean not null default false,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  primary key (user_id, id)
);

create table if not exists public.annotations (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  document_id text not null,
  quote text not null,
  note text not null default '',
  segments jsonb not null,
  reading_id text,
  origin jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  foreign key (user_id, document_id) references public.documents(user_id, id) on delete cascade
);

create table if not exists public.memory_events (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  event_type text not null,
  title text not null,
  body text not null,
  source_document_ids text[] not null default '{}',
  metadata jsonb not null default '{}'::jsonb,
  occurred_at timestamptz not null default now(),
  recorded_at timestamptz not null default now()
);

create table if not exists public.mind_dispatches (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  title text not null,
  body text not null,
  status text not null default 'provisional',
  trigger_summary text,
  provenance jsonb not null default '[]'::jsonb,
  cognitive_signals jsonb not null default '{}'::jsonb,
  model text,
  created_at timestamptz not null default now()
);

create table if not exists public.reading_state (
  user_id uuid not null references auth.users(id) on delete cascade,
  document_id text not null,
  last_block text,
  last_offset integer,
  last_opened_at timestamptz not null default now(),
  return_count integer not null default 0,
  metadata jsonb not null default '{}'::jsonb,
  primary key (user_id, document_id),
  foreign key (user_id, document_id) references public.documents(user_id, id) on delete cascade
);

create table if not exists public.memory_chunks (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  source_kind text not null,
  source_id text not null,
  content text not null,
  metadata jsonb not null default '{}'::jsonb,
  embedding vector(1536),
  created_at timestamptz not null default now()
);

alter table public.documents enable row level security;
alter table public.annotations enable row level security;
alter table public.memory_events enable row level security;
alter table public.mind_dispatches enable row level security;
alter table public.reading_state enable row level security;
alter table public.memory_chunks enable row level security;

create policy "documents_owner_all" on public.documents for all to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "annotations_owner_all" on public.annotations for all to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "memory_events_owner_all" on public.memory_events for all to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "mind_dispatches_owner_all" on public.mind_dispatches for all to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "reading_state_owner_all" on public.reading_state for all to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "memory_chunks_owner_all" on public.memory_chunks for all to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);

grant select, insert, update, delete on public.documents to authenticated;
grant select, insert, update, delete on public.annotations to authenticated;
grant select, insert, update, delete on public.memory_events to authenticated;
grant select, insert, update, delete on public.mind_dispatches to authenticated;
grant select, insert, update, delete on public.reading_state to authenticated;
grant select, insert, update, delete on public.memory_chunks to authenticated;
