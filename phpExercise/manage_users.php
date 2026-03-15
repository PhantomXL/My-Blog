<?php
session_start();
require_once "includes/header.php";
require_once "functions/userFunctions.php";
require_once "functions/databaseFunctions.php";
require_once "functions/genericFunctions.php";

requireAdmin();

$users = fetchAll("SELECT id, username, role FROM users ORDER BY username");
?>

<h2>👥 Manage Users</h2>

<a href="dashboard.php" class="back-dashboard-btn">← Back To Dashboard</a>

<h3>All Users</h3>

<?php if (empty($users)): ?>
    <p><em>No users found.</em></p>
<?php else: ?>
    <table>
        <tr>
            <th>Username</th>
            <th>Role</th>
            <th>Actions</th>
        </tr>
        <?php foreach ($users as $user): ?>
            <tr>
                <td><?= escape($user["username"]) ?></td>
                <td><strong><?= escape($user["role"]) ?></strong></td>
                <td>
                    <a href="servers/user_delete.php?id=<?= $user["id"] ?>" onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
                </td>
            </tr>
        <?php endforeach; ?>
    </table>
<?php endif; ?>

<h3>Create New User</h3>

<form action="servers/user_create.php" method="post" style="max-width: 400px;">
    <input type="text" name="username" placeholder="Username" required>
    <input type="password" name="password" placeholder="Password" required>
    <select name="role" required>
        <option value="">Select Role</option>
        <option value="user">User</option>
        <option value="admin">Admin</option>
    </select>
    <button type="submit" class="submit-post-btn">Create User</button>
</form>

<?php require_once "includes/footer.php"; ?>
