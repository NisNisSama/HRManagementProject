API_URL = "https://localhost:8090/attendance";

async function populateList() {
    try {
        const response = await fetch(API_URL+"/all")

        const employeeList = response.json();

        console.log(attendanceList);
    } catch (error) {
        
    }
}

document.addEventListener("DOMContentLoaded",populateList);