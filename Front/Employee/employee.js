API_URL = "https://localhost:8090/employee";

async function populateList() {
    try {
        const response = await fetch(API_URL+"/all")

        const employeeList = response.json();

        console.log(employeeList);
    } catch (error) {
        
    }
}

document.addEventListener("DOMContentLoaded",populateList);