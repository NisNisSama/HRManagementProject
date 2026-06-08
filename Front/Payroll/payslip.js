const API_URL = "http://localhost:8090/Payroll";

async function populateList(){
    try {
        const response = await fetch(API_URL+"/all")

        const PayslipList = await response.json();

        console.log(PayslipList);

        const tableBody = document.getElementById("PayslipList");
        tableBody.innerHTML = "";

        PayslipList.forEach(Payslip => {
            const row = document.createElement('tr');
    }); }catch (error) {
       
    }
}


document.addEventListener("DOMContentLoaded", populateList);
