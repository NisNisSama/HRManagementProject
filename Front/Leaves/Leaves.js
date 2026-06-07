const API_URL = "http://localhost:8090/Leaves";

async function populateList(){
    try {
        const response = await fetch(API_URL+"/all")

        const LeavesList = await response.json();

        console.log(LeavesList);

        const tableBody = document.getElementById("LeavesList");
        tableBody.innerHTML = "";

        LeavesList.forEach(Leave => {
            const row = document.createElement('tr');
        });
    } catch (error) {
        console.error('Error fetching Leave listings:', error);
    }

}