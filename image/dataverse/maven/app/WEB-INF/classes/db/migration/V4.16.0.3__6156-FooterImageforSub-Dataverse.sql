ALTER TABLE dataversetheme
ADD COLUMN IF NOT EXISTS logofooter VARCHAR,
ADD COLUMN IF NOT EXISTS logoFooterBackgroundColor VARCHAR,
ADD COLUMN IF NOT EXISTS logofooteralignment VARCHAR;
