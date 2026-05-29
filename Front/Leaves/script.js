function updateClock() {
    const now = new Date();
    document.getElementById('current-time').innerText = now.toLocaleTimeString();
}
setInterval(updateClock, 1000);

(function today(){
    document.getElementById('current-date').innerText = new Date().toDateString();
})();

// Chart.js Configuration
const ctx = document.getElementById('attendanceChart').getContext('2d');
new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Lateness', 'Absences', 'Leave Days', 'Overtime (Hrs)'],
        datasets: [{
            label: 'Monthly Stats',
            data: [3, 1, 2, 8.5], // Dynamic data from your backend would go here
            backgroundColor: [
                'rgba(234, 67, 53, 0.7)',  // Red for lateness
                'rgba(90, 92, 105, 0.7)',  // Gray for absences
                'rgba(78, 115, 223, 0.7)', // Blue for leave
                'rgba(28, 200, 138, 0.7)'  // Green for overtime
            ],
            borderRadius: 8
        }]
    },
    options: {
        maintainAspectRatio: false,
        plugins: {
            legend: { display: false }
        },
        scales: {
            y: { beginAtZero: true, grid: { drawBorder: false } },
            x: { grid: { display: false } }
        }
    }
});


function toggleReason(btn) {
    // 1. Close any other open floating reasons first
    document.querySelectorAll('.floating-reason').forEach(el => {
        el.classList.remove('active');
    });

    // 2. Find the floating div relative to the clicked button and show it
    const floatingDiv = btn.parentElement.nextElementSibling;
    floatingDiv.classList.add('active');
    
    // 3. Close when clicking anywhere else
    setTimeout(() => {
        document.addEventListener('click', function closeMenu(e) {
            if (!floatingDiv.contains(e.target) && e.target !== btn) {
                floatingDiv.classList.remove('active');
                document.removeEventListener('click', closeMenu);
            }
        }, { once: true });
    }, 10);
}