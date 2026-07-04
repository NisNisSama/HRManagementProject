const API_URL = "http://192.168.200.10:8090/Payroll";

async function populateList(){
    try {
        const response = await fetch(API_URL+"/all")

        const PayrollList = await response.json();

        console.log(PayrollList);

        const tableBody = document.getElementById("PayrollList");
        tableBody.innerHTML = "";

        PayrollList.forEach(Payroll => {
            const row = document.createElement('tr');
    }); }catch (error) {
       
    }
}


document.addEventListener("DOMContentLoaded", populateList);

