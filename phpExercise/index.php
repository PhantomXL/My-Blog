<?php
session_start();
require_once "includes/header.php";
require_once "functions/databaseFunctions.php";
require_once "functions/genericFunctions.php";

// Fetch all posts
$posts = fetchAll("SELECT id, title, content, created_at FROM posts ORDER BY created_at DESC");

// Pagination logic
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;
$postsPerPage = 5;
$totalPosts = count($posts);
$totalPages = ceil($totalPosts / $postsPerPage);
$startIndex = ($page - 1) * $postsPerPage;
$recentPosts = array_slice($posts, $startIndex, $postsPerPage);

// Selected post logic
$selectedPostId = $_GET["id"] ?? null;
$selectedPost = null;

if ($selectedPostId) {
    $postResults = fetchAll("SELECT * FROM posts WHERE id = ?", "i", [$selectedPostId]);
    $selectedPost = $postResults[0] ?? null;
}

if (!$selectedPost && !empty($recentPosts)) {
    $selectedPost = fetchAll("SELECT * FROM posts WHERE id = ?", "i", [$recentPosts[0]["id"]])[0];
}

// Allowed tags
$allowed_tags_preview = '<b><i><u><strong><em><h1><h2><h3><p><ol><ul><li><br><img><a>';
$allowed_tags_main = $allowed_tags_preview;
?>

<div style="display: grid; grid-template-columns: 300px 1fr; gap: 30px; margin-top: 20px;">
    <!-- Sidebar with recent posts -->
    <aside>
        <div class="recent-posts-container">
            <h3>📋 Recent Posts</h3>
            <?php if (empty($recentPosts)): ?>
                <div class="empty-posts-message">
                    <p><em>No posts yet.</em></p>
                </div>
            <?php else: ?>
                <?php foreach ($recentPosts as $post): ?>
                    <?php
                        $selectedClass = ($selectedPost && $selectedPost["id"] == $post["id"]) ? 'selected' : '';
                        $preview_content = strip_tags($post["content"], $allowed_tags_preview);
                    ?>
                    <a href="?id=<?= $post["id"] ?>&page=<?= $page ?>" 
                       class="recent-post-link <?= $selectedClass ?>">
                        <strong><?= escape($post["title"]) ?></strong>
                        <div class="recent-post-preview">
                            <?= $preview_content ?>
                        </div>
                    </a>
                <?php endforeach; ?>

                <!-- Pagination numbers -->
                <?php if ($totalPages > 1): ?>
                    <div class="pagination">
                        <?php if ($page > 1): ?>
                            <a href="?page=<?= $page - 1 ?>">← Prev</a>
                        <?php endif; ?>

                        <?php for ($i = 1; $i <= $totalPages; $i++): ?>
                            <?php $activeClass = ($i == $page) ? 'active' : ''; ?>
                            <a href="?page=<?= $i ?>" class="<?= $activeClass ?>"><?= $i ?></a>
                        <?php endfor; ?>

                        <?php if ($page < $totalPages): ?>
                            <a href="?page=<?= $page + 1 ?>">Next →</a>
                        <?php endif; ?>
                    </div>
                <?php endif; ?>
            <?php endif; ?>
        </div>
    </aside>

    <!-- Main content area -->
    <main>
        <?php if ($selectedPost): ?>
            <article class="main-article">
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

                <?php if (!empty($comments)): ?>
                    <div class="comment-list">
                        <?php foreach ($comments as $c): ?>
                            <div class="comment-card">
                                <strong><?= escape($c["name"]) ?></strong>
                                <p><?= escape($c["comment"]) ?></p>
                            </div>
                        <?php endforeach; ?>
                    </div>
                <?php else: ?>
                    <p><em>No comments yet. Be the first to comment!</em></p>
                <?php endif; ?>

                <h3>Add a Comment</h3>

                <form action="servers/comment_create.php" method="post" class="post-comment-container <?php if(isset($_SESSION['user'])) echo 'logged-in'; ?>">
                    <input type="hidden" name="post_id" value="<?= $selectedPost["id"] ?>">
                    
                    <?php if (!isset($_SESSION["user"])): ?>
                        <input type="text" name="name" placeholder="Your Name" required>
                    <?php endif; ?>
                    
                    <textarea name="comment" placeholder="Your Comment" required></textarea>
                    <button type="submit">Post Comment</button>
                </form>
            </article>
        <?php else: ?>
            <div class="empty-posts-message">
                <h2>📰 Welcome to My Blog</h2>
                <p>Select a post from the sidebar to read.</p>
            </div>
        <?php endif; ?>
    </main>
</div>

<?php require_once "includes/footer.php"; ?>