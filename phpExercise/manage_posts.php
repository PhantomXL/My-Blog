<?php
session_start();
require_once "includes/header.php";
require_once "functions/userFunctions.php";
require_once "functions/databaseFunctions.php";
require_once "functions/genericFunctions.php";

requireLogin();

$userId = $_SESSION["user"]["id"];
$posts = fetchAll(
    "SELECT id, title, content, created_at FROM posts WHERE user_id = ? ORDER BY created_at DESC",
    "i",
    [$userId]
);
?>

<h2>📝 Manage Posts</h2>
<a href="dashboard.php" class="back-dashboard-btn">← Back To Dashboard</a>

<h3>Your Posts</h3>

<?php if (empty($posts)): ?>
    <p><em>You haven't created any posts yet.</em></p>
<?php else: ?>
    <table>
        <tr>
            <th>Title</th>
            <th>Created</th>
            <th>Actions</th>
        </tr>
        <?php foreach ($posts as $post): ?>
            <tr>
                <td><?= escape($post["title"]) ?></td>
                <td><?= date("M d, Y", strtotime($post["created_at"])) ?></td>
                <td>
                    <a href="post.php?id=<?= $post["id"] ?>">View</a>
                    <a href="servers/post_delete.php?id=<?= $post["id"] ?>" onclick="return confirm('Are you sure you want to delete this post?')">Delete</a>
                </td>
            </tr>
        <?php endforeach; ?>
    </table>
<?php endif; ?>

<div id="editor" contenteditable="true"></div>
<link rel="stylesheet" href="assets/css/editor.css">