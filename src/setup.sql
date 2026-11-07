-- Create the organization table
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

-- =========================================
-- Insert sample organization records
-- =========================================
INSERT INTO organization
    (name, description, contact_email, logo_filename)
VALUES
    (
        'BrightFuture Builders',
        'A nonprofit focused on improving community infrastructure through sustainable construction projects.',
        'info@brightfuturebuilders.org',
        'brightfuture-logo.png'
    ),
    (
        'GreenHarvest Growers',
        'An urban farming collective promoting food sustainability and education in local neighborhoods.',
        'contact@greenharvest.org',
        'greenharvest-logo.png'
    ),
    (
        'UnityServe Volunteers',
        'A volunteer coordination group supporting local charities and service initiatives.',
        'hello@unityserve.org',
        'unityserve-logo.png'
    );

-- =========================================
-- Create the service_projects table
-- =========================================
CREATE TABLE service_projects (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(150) NOT NULL,
    date DATE NOT NULL,

    CONSTRAINT fk_organization
        FOREIGN KEY (organization_id)
        REFERENCES organization(organization_id)
);    
-- =========================================
-- Insert sample service project records
-- =========================================
INSERT INTO service_projects
    (organization_id, title, description, location, date)
VALUES

-- BrightFuture Builders (Organization ID: 1)
(
    1,
    'Community Library Construction',
    'Construction of a community library to improve access to educational resources for local residents.',
    'Independence Layout, Enugu',
    '2026-12-10'
),
(
    1,
    'Rural School Renovation',
    'Renovation of classrooms and improvement of learning facilities in a rural school.',
    'Nsukka, Enugu',
    '2026-12-15'
),
(
    1,
    'Community Health Centre Upgrade',
    'Improvement of healthcare facilities through renovation and provision of essential equipment.',
    'New Haven, Enugu',
    '2026-12-20'
),
(
    1,
    'Safe Housing Initiative',
    'Construction and improvement of affordable housing for families in need.',
    'Trans-Ekulu, Enugu',
    '2026-12-22'
),
(
    1,
    'Public Water Facility Improvement',
    'Rehabilitation of public water facilities to improve access to clean and safe drinking water.',
    'Abakpa Nike, Enugu',
    '2026-12-28'
),

-- GreenHarvest Growers (Organization ID: 2)
(
    2,
    'Urban Vegetable Garden',
    'Development of a community vegetable garden to encourage local food production.',
    'GRA, Enugu',
    '2026-12-11'
),
(
    2,
    'Sustainable Farming Workshop',
    'Training local farmers on sustainable agricultural practices and improved crop production.',
    'Nsukka, Enugu',
    '2026-12-16'
),
(
    2,
    'Community Composting Project',
    'Promotion of organic waste recycling through community composting and soil improvement.',
    'Uwani, Enugu',
    '2026-12-19'
),
(
    2,
    'School Agriculture Programme',
    'Teaching students basic agricultural skills through practical school gardening activities.',
    'Trans-Ekulu, Enugu',
    '2026-12-23'
),
(
    2,
    'Local Food Production Initiative',
    'Supporting small-scale food producers with agricultural knowledge and community resources.',
    'Emene, Enugu',
    '2026-12-29'
),

-- UnityServe Volunteers (Organization ID: 3)
(
    3,
    'Community Clean-Up Campaign',
    'Organizing volunteers to clean public spaces and promote proper waste disposal.',
    'Ogbete, Enugu',
    '2026-12-12'
),
(
    3,
    'Youth Mentorship Programme',
    'Connecting young people with mentors to support personal development and career growth.',
    'New Haven, Enugu',
    '2026-12-17'
),
(
    3,
    'Elderly Support Initiative',
    'Providing companionship and basic assistance to elderly members of the community.',
    'Independence Layout, Enugu',
    '2026-12-21'
),
(
    3,
    'Neighborhood Food Donation Drive',
    'Coordinating food donations and distribution to vulnerable families.',
    'Abakpa Nike, Enugu',
    '2026-12-26'
),
(
    3,
    'Community Skills Development',
    'Organizing volunteer-led training sessions to help residents develop practical skills.',
    'Emene, Enugu',
    '2026-12-30'
);