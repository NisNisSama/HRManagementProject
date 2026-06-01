const API_URL = "http://localhost:8090/candidate";

async function populateList(){
    try {
        const response = await fetch(API_URL+"/all")

        const candidateList = await response.json();

        console.log(candidateList);

        const tableBody = document.getElementById("candidateList");
        tableBody.innerHTML = "";

        candidateList.forEach(candidate => {
            const row = document.createElement('tr');

            row.innerHTML = `
                <td>${candidate.candidateId}</td>
                <td>
                    <strong class="text-dark d-block">${candidate.name}</strong>
                    <small class="text-muted">${candidate.email}</small>
                </td>
                <td>
                    <span class="fw-semibold text-primary">"Generic"</span>
                    <span class="d-block text-secondary small fw-bold">${candidate.jobId}</span>
                </td>
                <td>
                    <a href="#" class="btn btn-sm btn-outline-secondary d-inline-flex align-items-center gap-1" onclick="alert('Opening secure cloud storage link or dynamic PDF reader context for Alex_Rivera_CV.pdf')">
                        <i class="bi bi-file-earmark-pdf-fill text-danger"></i> View Resume
                    </a>
                </td>
                <td>
                    <form action="UpdateProgressionServlet" method="POST" class="d-inline">
                        <input type="hidden" name="applicationId" value="APP-901">
                        <select class="form-select form-select-sm border-primary text-primary fw-medium" name="status" onchange="this.form.submit()" style="width: 180px;">
                            <option value="Applied" selected>New Application</option>
                            <option value="Screening">Initial Screening</option>
                            <option value="Interviewing">Interview Loop</option>
                            <option value="Offer">Offer Extension Phase</option>
                        </select>
                    </form>
                </td>
                <td class="text-end">
                    <form action="DropCandidateServlet" method="POST" class="d-inline" onsubmit="return confirm('Are you sure you want to drop this candidate from the pipeline?')">
                        <input type="hidden" name="applicationId" value="APP-901">
                        <button type="submit" class="btn btn-sm btn-danger d-inline-flex align-items-center gap-1" title="Drop Candidate">
                            <i class="bi bi-person-x-fill"></i> Drop
                        </button>
                    </form>
                </td>
            `;

            tableBody.appendChild(row);
        });
    } catch (error) {
        console.error('Error fetching job listings:', error);
    }
}

document.addEventListener("DOMContentLoaded", populateList);