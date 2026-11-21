import { getAllProjects, getProjectDetails } from '../models/projects.js';
import { getCategoriesByProjectId } from '../models/categories.js';

const showProjectsPage = async (req, res) => {
    const projects = await getAllProjects();
    const title = 'Service Projects';

    res.render('projects', { title, projects });
};

const showProjectDetailsPage = async (req, res) => {
    const projectId = req.params.id;

    const projectDetails = await getProjectDetails(projectId);
    const categories = await getCategoriesByProjectId(projectId);

    const title = 'Project Details';

    res.render('project', { title, projectDetails, categories });
};

export { showProjectsPage, showProjectDetailsPage };