import db from './db.js';

const getAllCategories = async () => {
    const query = `
     SELECT category_id, name
        FROM public.categories
        ORDER BY category_id;
    `;

    const result = await db.query(query);

    return result.rows;
};

const getCategoryDetails = async (categoryId) => {
    const query = `
        SELECT category_id, name
        FROM public.categories
        WHERE category_id = $1;
    `;

    const queryParams = [categoryId];
    const result = await db.query(query, queryParams);

    return result.rows.length > 0 ? result.rows[0] : null;
};

const getCategoriesByProjectId = async (projectId) => {
    const query = `
        SELECT
            c.category_id,
            c.name
        FROM public.project_categories pc
        JOIN public.categories c
            ON pc.category_id = c.category_id
        WHERE pc.project_id = $1
        ORDER BY c.category_id;
    `;

    const queryParams = [projectId];
    const result = await db.query(query, queryParams);

    return result.rows;
};

const getProjectsByCategoryId = async (categoryId) => {
    const query = `
        SELECT
            sp.project_id,
            sp.title,
            sp.description,
            sp.location,
            sp.date
        FROM public.project_categories pc
        JOIN public.service_projects sp
            ON pc.project_id = sp.project_id
        WHERE pc.category_id = $1
        ORDER BY sp.date ASC;
    `;

    const queryParams = [categoryId];
    const result = await db.query(query, queryParams);

    return result.rows;
};

export { getAllCategories, getCategoryDetails, getCategoriesByProjectId, getProjectsByCategoryId };