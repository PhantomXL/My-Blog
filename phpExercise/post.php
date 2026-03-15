<?php
session_start();
require_once "includes/header.php";
require_once "functions/databaseFunctions.php";
require_once "functions/genericFunctions.php";

$postId = $_GET["id"] ?? null;
if (!$postId) {
    die("Post not found.");
}

$postResults = fetchAll(
    "SELECT * FROM posts WHERE id = ?",
    "i",
    [$postId]
);

$post = $postResults[0] ?? null;
if (!$post) {
    die("Post not found.");
}

$comments = fetchAll(
    "SELECT * FROM comments WHERE post_id = ? ORDER BY id DESC",
    "i",
    [$postId]
);
?>

<article class="post-card">
    <h1><?= escape($post["title"]) ?></h1>

    <p class="post-date">
        📅 <?= date("F d, Y", strtotime($post["created_at"])) ?>
    </p>

    <div class="post-full-content">
        <?php
            // Allowed tags from editor
            $allowed_tags = '<b><i><u><strong><em><h1><h2><h3><p><ol><ul><li><br><img><a>';

            // Strip unwanted tags but keep formatting & images
            $safe_content = strip_tags($post["content"], $allowed_tags);

            // Keep your nl2br functionality for line breaks
            echo nl2br($safe_content);
        ?>
    </div>

    <hr>

    <h3>💬 Comments</h3>

    <?php if (empty($comments)): ?>
        <p><em>No comments yet. Be the first to comment!</em></p>
    <?php else: ?>
        <?php foreach ($comments as $comment): ?>
            <div class="comment">
                <strong><?= escape($comment["name"]) ?></strong>
                <p><?= escape($comment["comment"]) ?></p>
            </div>
        <?php endforeach; ?>
    <?php endif; ?>

    <h3>Add a Comment</h3>

    <form action="servers/comment_create.php" method="post">
        <input type="hidden" name="post_id" value="<?= $postId ?>">

        <?php if (!isset($_SESSION["user"])): ?>
            <input type="text" name="name" placeholder="Your Name" required>
        <?php endif; ?>

        <textarea name="comment" placeholder="Your Comment" required></textarea>

        <button type="submit" class="submit-post-btn">
            Post Comment
        </button>
    </form>
</article>

<?php require_once "includes/footer.php"; ?>