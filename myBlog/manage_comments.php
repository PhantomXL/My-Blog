<?php
session_start();
require_once "includes/header.php";
require_once "functions/userFunctions.php";
require_once "functions/databaseFunctions.php";
require_once "functions/genericFunctions.php";

requireAdmin();

$comments = fetchAll(
    "SELECT c.id, c.name, c.comment, c.post_id, p.title FROM comments c JOIN posts p ON c.post_id = p.id ORDER BY c.id DESC"
);
?>

<h2>💬 Manage Comments</h2>

<a href="dashboard.php" class="back-dashboard-btn">← Back To Dashboard</a>

<h3>All Comments</h3>

<?php if (empty($comments)): ?>
    <p><em>No comments found.</em></p>
<?php else: ?>
    <table>
        <tr>
            <th>Post</th>
            <th>Name</th>
            <th>Comment</th>
            <th>Actions</th>
        </tr>
        <?php foreach ($comments as $comment): ?>
            <tr>
                <td><?= escape($comment["title"]) ?></td>
                <td><?= escape($comment["name"]) ?></td>
                <td><?= escape(substr($comment["comment"], 0, 50)) ?><?= strlen($comment["comment"]) > 50 ? '...' : '' ?></td>
                <td>
                    <a href="servers/comment_delete.php?id=<?= $comment["id"] ?>" onclick="return confirm('Are you sure you want to delete this comment?')">Delete</a>
                </td>
            </tr>
        <?php endforeach; ?>
    </table>
<?php endif; ?>

<?php require_once "includes/footer.php"; ?>
