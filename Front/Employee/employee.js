API_URL = "http://192.168.200.10:8090/employee";

async function populateList() {
    const tableBody = document.getElementById("tableBody");
    const token = localStorage.getItem('userToken');
    try {
        const response = await fetch(API_URL+"/all", {
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${token}` 
                }
            })
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const employeeList = await response.json();
        console.log(employeeList);

        tableBody.innerHTML = '';

        employeeList.forEach(employee => {
            const row = document.createElement('tr');

            row.innerHTML = `
                <td class="fw-bold text-secondary">${employee.empId}</td>
                <td class="fw-semibold text-dark">${employee.name}</td>
                <td><span class="badge bg-primary-subtle text-primary">${employee.department}</span></td>
                <td>${employee.role}</td>
                <td class="text-end">
                    <a href="profile.jsp?targetEmpId=${employee.empId}" class="btn btn-sm btn-primary fw-semibold"><i class="bi bi-pencil-square"></i> View & Modify Profile</a>
                </td>
            `;

            tableBody.appendChild(row);
        });
    } catch (error) {
        tableBody.innerHTML = `<tr><td colspan="6" class="text-center text-danger py-4">${error}</td></tr>`;
    }
}

document.addEventListener("DOMContentLoaded",populateList);