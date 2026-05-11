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
                    <div class="card-body p-4">
                        <form>
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
</body>
</html>