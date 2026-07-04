// Configuration: Replace with your actual API endpoint or JSON file path
const API_URL = 'http://192.168.200.10:8090/job';
//const API_URL = 'http://localhost:8090/job';

/**
 * Fetches jobs from the backend JSON API and populates the UI table.
 */
async function fetchAndPopulateJobs() {
    const tableBody = document.getElementById('jobTableBody');
    
    try {
        const response = await fetch(API_URL+"/findAll");
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        
        const jobList = await response.json();
        console.log(jobList);
        
        // Clear any existing hardcoded table rows or placeholders
        tableBody.innerHTML = '';

        // Iterate through each job object and construct the DOM elements
        jobList.forEach(job => {
            const row = document.createElement('tr');
            
             // Set up context-dependent badges/icons
        //    const deptBadgeClass = job.department === 'Engineering' ? 'bg-primary-subtle text-primary' : 'bg-info-subtle text-info text-dark';
        //     const locationIcon = job.location.toLowerCase().includes('remote') ? 'bi-geo-alt-fill' : 'bi-building';

        //     // Generate HR Management Controls only if the logged-in user is HR
        //     let hrControlsHtml = '';
        //     if (currentUser.role === 'HR') {
        //         hrControlsHtml = `
        //             <a href="jobedit.jsp?id=${job.id}" class="btn btn-sm btn-warning text-dark me-1" title="Edit Listing">
        //                 <i class="bi bi-pencil-square"></i>
        //             </a>
        //             <button class="btn btn-sm btn-danger" onclick="confirmDelete('${job.jobCode}')" title="Remove Listing">
        //                 <i class="bi bi-trash3-fill"></i>
        //             </button>
        //         `;
        //     }

            const[role, site, salary] = job.description.split("/");
            // Assemble the complete row structure
            row.innerHTML = `
                <td class="fw-bold text-secondary">${job.jobId}</td>
                <td>
                    <span class="fw-semibold text-dark d-block">${job.title}</span>
                    <small class="text-muted">Posted ${job.date}</small>
                </td>
                <td><span class="">${role}</span></td>
                <td><i class="bi me-1 bi-geo-alt-fill"></i>${site}</td>
                <td>${salary}</td>
                <td>
                    <a href="jobedit.jsp?id=${job.jobId}" class="btn btn-sm btn-warning text-dark me-1" title="Edit Listing">
                        <i class="bi bi-pencil-square"></i>
                    </a>
                    <button class="btn btn-sm btn-danger" onclick="confirmDelete('${job.jobId}')" title="Remove Listing">
                        <i class="bi bi-trash3-fill"></i>
                    </button>
                </td>
            `;

            tableBody.appendChild(row);
        });

    } catch (error) {
        console.error('Error fetching job listings:', error);
        tableBody.innerHTML = `<tr><td colspan="6" class="text-center text-danger py-4">Failed to load job listings. Please try again later.</td></tr>`;
    }
}

/**
 * Handle job deletion confirmations safely outside the template literal string
 */
function confirmDelete(jobCode) {
    if (confirm(`Are you sure you want to remove job listing ${jobCode}?`)) {
        // Implement your actual delete fetch request logic here
        console.log(`Deleting ${jobCode}...`);
    }
}

// Fire the data fetch once the DOM content is ready
document.addEventListener('DOMContentLoaded', fetchAndPopulateJobs);