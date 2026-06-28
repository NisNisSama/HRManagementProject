<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HR Portal Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="login.css">
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5 col-lg-4">
                <div class="card login-card">
                    <div class="login-header">
                        <div class="h3 fw-bold text-primary">HR<span class="text-dark">Pulse</span></div>
                        <p class="text-muted">Welcome back! Please login to your account.</p>
                    </div>

                    <c:if test="${not empty param.error}">
                        <div class="h6 text-danger text-center">
                            <P class="fw-bold d-inline">${param.error}</p>
                        </div>
                    </c:if>

                    <div class="card-body p-4">
                        <form id="loginForm">
                            <div class="mb-3">
                                <label for="email" class="form-label text-secondary small fw-bold">Identification</label>
                                <input type="email" class="form-control" id="email" placeholder="name@department" required>
                            </div>
                            <div class="mb-3">
                                <div class="d-flex justify-content-between">
                                    <label for="password" class="form-label text-secondary small fw-bold">Password</label>
                                    <a href="#" class="text-decoration-none small">Forgot?</a>
                                </div>
                                <input type="password" class="form-control" id="password" placeholder="••••••••" required>
                            </div>
                            <button type="submit" class="btn btn-primary w-100 mt-2">Sign In</button>
                        </form>
                    </div>
                    <div class="card-footer bg-white border-0 pb-4 text-center">
                        <p class="small text-muted mb-0">New hire? <a href="#" class="text-decoration-none">Contact IT Support</a></p>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <form id="sessionSetter" action="set-session.jsp" method="POST" style="display: none;">
        <input type="hidden" name="role" id="tomcatRole">
        <input type="hidden" name="username" id="tomcatUsername">
    </form>

    <script>
        //const API = "http://192.168.200.10:8090";
        const API = "http://localhost:8090" 

        document.getElementById('loginForm').addEventListener('submit', function(e) {
            e.preventDefault(); // Stop page from reloading automatically

            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;

            // Step A: Authenticate against Micronaut
            fetch(API+"/login", {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ username: email, password: password })
            })
            .then(res => {
                if (!res.ok) throw new Error(res.status);
                return res.json();
            })
            .then(data => {
                // Step B: Save token to LocalStorage for future Micronaut API calls
                localStorage.setItem('userToken', data.token);

                // Step C: Map the role data payload from Micronaut and pass it to Tomcat
                document.getElementById('tomcatRole').value = data.employee.role; 
                document.getElementById('tomcatUsername').value = data.employee.name+"@"+data.employee.department;

                // Step D: Submit hidden form to create Tomcat session context
                document.getElementById('sessionSetter').submit();
            })
            .catch(err => {
                window.location.href = "/login.jsp?error=Failed Login: "+encodeURIComponent(err.message);
            });
        });
    </script>

</body>
</html>