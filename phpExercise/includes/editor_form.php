<form id="postTitle" action="servers/post_create.php" method="post" enctype="multipart/form-data">
    <input type="text" id="postTitle" name="title" placeholder="Enter Post Title">

    <div class="editor-container">
        <!-- Toolbar -->
        <div id="editorToolbar" class="editor-toolbar">
            <button type="button" data-command="bold" title="Bold (Ctrl+B)"><b>B</b></button>
            <button type="button" data-command="italic" title="Italic (Ctrl+I)"><i>I</i></button>
            <button type="button" data-command="underline" title="Underline (Ctrl+U)"><u>U</u></button>
            <button type="button" data-command="h1" title="Heading 1 (Ctrl+Alt+1)">H1</button>
            <button type="button" data-command="h2" title="Heading 2 (Ctrl+Alt+2)">H2</button>
            <button type="button" data-command="h3" title="Heading 3 (Ctrl+Alt+3)">H3</button>
            <button type="button" data-command="justifyLeft" title="Align Left (Ctrl+Shift+L)">
            <svg viewBox="0 0 24 24" width="18" height="18">
            <rect x="3" y="5" width="18" height="2"/>
            <rect x="3" y="9" width="12" height="2"/>
            <rect x="3" y="13" width="18" height="2"/>
            <rect x="3" y="17" width="12" height="2"/>
            </svg>
            </button>
            <button type="button" data-command="justifyCenter" title="Align Center (Ctrl+Shift+E)">
            <svg viewBox="0 0 24 24" width="18" height="18">
            <rect x="3" y="5" width="18" height="2"/>
            <rect x="6" y="9" width="12" height="2"/>
            <rect x="3" y="13" width="18" height="2"/>
            <rect x="6" y="17" width="12" height="2"/>
            </svg>
            </button>
            <button type="button" data-command="justifyRight" title="Align Right (Ctrl+Shift+R)">
            <svg viewBox="0 0 24 24" width="18" height="18">
            <rect x="3" y="5" width="18" height="2"/>
            <rect x="9" y="9" width="12" height="2"/>
            <rect x="3" y="13" width="18" height="2"/>
            <rect x="9" y="17" width="12" height="2"/>
            </svg>
            </button>
            <button data-command="insertUnorderedList" title="Unordered List (Ctrl+Shift+8)">
            <svg viewBox="0 0 24 24" width="18" height="18">
            <circle cx="5" cy="6" r="1.5"/>
            <circle cx="5" cy="12" r="1.5"/>
            <circle cx="5" cy="18" r="1.5"/>
            <rect x="9" y="5" width="12" height="2"/>
            <rect x="9" y="11" width="12" height="2"/>
            <rect x="9" y="17" width="12" height="2"/>
            </svg>
            </button>
            <button data-command="insertOrderedList" title="Ordered List (Ctrl+Shift+7)">
            <svg viewBox="0 0 24 24" width="18" height="18">
            <text x="3" y="8" font-size="6">1.</text>
            <text x="3" y="14" font-size="6">2.</text>
            <text x="3" y="20" font-size="6">3.</text>
            <rect x="9" y="5" width="12" height="2"/>
            <rect x="9" y="11" width="12" height="2"/>
            <rect x="9" y="17" width="12" height="2"/>
            </svg>
            </button>
            <button type="button" id="insertLinkBtn" title="Insert Link (Ctrl+K)">🔗 Link</button>
            <button type="button" id="insertMapBtn" title="Insert Map (Ctrl+M)">🗺️ Map</button>
            <input type="file" id="imageUploader" accept="image/*" style="display:none;">
            <button type="button" id="insertImageBtn" title="Insert Image (Ctrl+Shift+I)">📷 Image</button>
        </div>

        <!-- Editable content -->
        <div id="editor" class="editor-content" contenteditable="true"></div>

        <!-- Image size controls -->
        <div id="image-controls" hidden class="image-controls">
            <label>Image Size: <input type="number" id="img-size" min="5" max="200" value="20"></label>
            <button type="button" id="img-decrease">-</button>
            <button type="button" id="img-increase">+</button>
            <button type="button" id="img-done">Done</button>
        </div>
    </div>

    <input type="hidden" name="content" id="contentInput">
    <button type="submit" class="back-dashboard-btn">Create Post</button>
</form>

<!-- Include JS module -->
<script type="module" src="assets/js/editor.js"></script>