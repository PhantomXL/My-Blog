<?php
session_start();
require_once "includes/header.html.php";
require_once "functions/databaseFunctions.php";
require_once "functions/genericFunctions.php";

$posts = fetchAll(
    "SELECT id, title, content, created_at FROM posts ORDER BY created_at DESC"
);

// Selected post logic
$selectedPostId = $_GET['id'] ?? null;
$selectedPost = null;

if ($selectedPostId) {
    $postResults = fetchAll("SELECT * FROM posts WHERE id = ?", "i", [$selectedPostId]);
    $selectedPost = $postResults[0] ?? null;
}

// Allowed tags
$allowed_tags_preview = '<b><i><u><strong><em><h1><h2><h3><p><ol><ul><li><br><img><a>';
$allowed_tags_main = $allowed_tags_preview;
?>

<?php if ($selectedPost): ?>
    <!-- Back to All Posts Button -->
    <div style="text-align: left; margin: 20px 0;">
        <a href="view_all_posts.php" class="back-dashboard-btn">
            ← Back to All Posts
        </a>
    </div>

    <!-- Full Post -->
    <div class="post-card">
        <h1><?= escape($selectedPost["title"]) ?></h1>
        <p class="post-date">📅 <?= date("F d, Y", strtotime($selectedPost["created_at"])) ?></p>
        <div class="main-article-content">
            <?= nl2br(strip_tags($selectedPost["content"], $allowed_tags_main)) ?>
        </div>

        <hr>

        <h3>💬 Comments</h3>

        <?php 
        $comments = fetchAll("SELECT * FROM comments WHERE post_id = ? ORDER BY id DESC", "i", [$selectedPost["id"]]);
        ?>

        <?php if (empty($comments)): ?>
            <p><em>No comments yet. Be the first to comment!</em></p>
        <?php else: ?>
            <?php foreach ($comments as $c): ?>
                <div class="comment">
                    <strong><?= escape($c["name"]) ?></strong>
                    <p><?= escape($c["comment"]) ?></p>
                </div>
            <?php endforeach; ?>
        <?php endif; ?>

        <h3>Add a Comment</h3>

        <form action="servers/comment_create.php" method="post" class="post-comment-container">
            <input type="hidden" name="post_id" value="<?= $selectedPost["id"] ?>">
            <?php if (!isset($_SESSION["user"])): ?>
                <input type="text" name="name" placeholder="Your Name" required>
            <?php endif; ?>
            <textarea name="comment" placeholder="Your Comment" required></textarea>
            <button type="submit">Post Comment</button>
        </form>
    </div>

<?php else: ?>
    <h2>📚 All Posts</h2>

    <?php if (empty($posts)): ?>
        <div class="empty-posts-message">
            <p>No posts available yet.</p>
        </div>
    <?php else: ?>
        <div class="view-all-posts-grid">
            <?php foreach ($posts as $post): ?>
                <a href="view_all_posts.php?id=<?= $post["id"] ?>" class="view-post-card">
                    <h3><?= escape($post["title"]) ?></h3>
                    <p class="post-date">📅 <?= date("M d, Y", strtotime($post["created_at"])) ?></p>
                    <div class="post-preview-text">
                        <?= nl2br(strip_tags($post["content"], $allowed_tags_preview)) ?>
                    </div>
                </a>
            <?php endforeach; ?>
        </div>
    <?php endif; ?>
<?php endif; ?>

<?php require_once "includes/footer.php"; ?>