-- Adding postgis extension for geometry support
CREATE EXTENSION IF NOT EXISTS postgis;

-- Creating farms table with PostGIS Point geometry
CREATE TABLE farms (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(150),
    town VARCHAR(100) NOT NULL,
    location GEOMETRY(Point, 4326) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
