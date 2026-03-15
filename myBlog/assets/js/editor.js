import {
    uploadImage,
    updateImageSize,
    selectImage,
    clearImageSelection
} from './editorFunctions.js';

document.addEventListener("DOMContentLoaded", () => {

    const editor = document.getElementById("editor");
    const contentInput = document.getElementById("contentInput");
    const postForm = document.getElementById("postForm");

    const imageControls = document.getElementById("image-controls");
    const imgSizeInput = document.getElementById("img-size");
    const imgDecreaseBtn = document.getElementById("img-decrease");
    const imgIncreaseBtn = document.getElementById("img-increase");
    const imgDoneBtn = document.getElementById("img-done");
    const insertLinkBtn = document.getElementById("insertLinkBtn");
    const insertMapBtn = document.getElementById("insertMapBtn");
    const imageUploader = document.getElementById("imageUploader");
    const insertImageBtn = document.getElementById("insertImageBtn");

    const toolbarButtons = document.querySelectorAll('#editorToolbar button[data-command]');

    let activeImage = null;

    function updateToolbarState() {

        toolbarButtons.forEach(btn => {

            const cmd = btn.dataset.command;
            if (!cmd) return;

            try {

                if (document.queryCommandState(cmd)) {
                    btn.classList.add("active");
                } else {
                    btn.classList.remove("active");
                }

            } catch {
                btn.classList.remove("active");
            }
        });
    }

    document.addEventListener("selectionchange", () => {

        const sel = window.getSelection();
        if (!sel.rangeCount) return;

        if (editor.contains(sel.anchorNode)) {
            updateToolbarState();
        }
    });

    toolbarButtons.forEach(btn => {

        btn.addEventListener("click", () => {

            const cmd = btn.dataset.command;

            if (["h1","h2","h3"].includes(cmd)) {
                document.execCommand("formatBlock", false, cmd);
            } else {
                document.execCommand(cmd, false, null);
            }

            updateToolbarState();
        });
    });

    /* Keyboard Shortcuts */

    document.addEventListener("keydown", (e) => {

        const sel = window.getSelection();
        if (!sel.rangeCount) return;

        if (!editor.contains(sel.anchorNode)) return;

        if (e.ctrlKey && !e.shiftKey && !e.altKey) {

            switch (e.key.toLowerCase()) {

                case "b":
                    e.preventDefault();
                    document.execCommand("bold");
                    break;

                case "i":
                    e.preventDefault();
                    document.execCommand("italic");
                    break;

                case "u":
                    e.preventDefault();
                    document.execCommand("underline");
                    break;

                case "k":
                    e.preventDefault();
                    insertLinkBtn.click();
                    break;

                case "m":
                    e.preventDefault();
                    insertMapBtn.click();
                    break;

                case "z":
                    e.preventDefault();
                    document.execCommand("undo");
                    break;

                case "y":
                    e.preventDefault();
                    document.execCommand("redo");
                    break;
            }
        }

        if (e.ctrlKey && e.shiftKey) {

            switch (e.key.toLowerCase()) {

                case "l":
                    e.preventDefault();
                    document.execCommand("justifyLeft");
                    break;

                case "e":
                    e.preventDefault();
                    document.execCommand("justifyCenter");
                    break;

                case "r":
                    e.preventDefault();
                    document.execCommand("justifyRight");
                    break;

                case "i":
                    e.preventDefault();
                    insertImageBtn.click();
                    break;

                case "8":
                    e.preventDefault();
                    document.execCommand("insertUnorderedList");
                    break;

                case "7":
                    e.preventDefault();
                    document.execCommand("insertOrderedList");
                    break;
            }
        }

        if (e.ctrlKey && e.altKey) {

            switch (e.key) {

                case "1":
                    e.preventDefault();
                    document.execCommand("formatBlock", false, "h1");
                    break;

                case "2":
                    e.preventDefault();
                    document.execCommand("formatBlock", false, "h2");
                    break;

                case "3":
                    e.preventDefault();
                    document.execCommand("formatBlock", false, "h3");
                    break;
            }
        }

        updateToolbarState();
    });

    /* Insert Link */

    if (insertLinkBtn) {

        insertLinkBtn.addEventListener("click", () => {

            const url = prompt("Enter URL:");
            if (!url) return;

            const selection = window.getSelection();

            if (selection && selection.toString()) {
                document.execCommand("createLink", false, url);
            } else {

                const text = prompt("Enter text for link:");
                if (!text) return;

                const a = document.createElement("a");
                a.href = url;
                a.textContent = text;
                a.target = "_blank";

                editor.appendChild(a);
            }
        });
    }

    /* Insert Map */

    if (insertMapBtn) {

        insertMapBtn.addEventListener("click", () => {

            const location = prompt("Enter map location:");
            if (!location) return;

            const iframe = document.createElement("iframe");

            iframe.width = 300;
            iframe.height = 200;
            iframe.style.border = "0";
            iframe.loading = "lazy";
            iframe.referrerPolicy = "no-referrer-when-downgrade";

            iframe.src =
                `https://www.google.com/maps?q=${encodeURIComponent(location)}&output=embed`;

            editor.appendChild(iframe);
        });
    }

    /* Image Upload */

    if (insertImageBtn && imageUploader) {

        insertImageBtn.addEventListener("click", () => imageUploader.click());

        imageUploader.addEventListener("change", () => {

            if (imageUploader.files[0]) {

                uploadImage(imageUploader.files[0], editor);
                imageUploader.value = "";
            }
        });
    }

    /* Image Selection */

    editor.addEventListener("click", (e) => {

        if (e.target.tagName === "IMG") {

            activeImage = selectImage(
                e.target,
                editor,
                imageControls,
                imgSizeInput
            );

        } else if (!imageControls.contains(e.target)) {

            activeImage = clearImageSelection(editor, imageControls);
        }
    });

    /* Image Size Controls */

    if (imgSizeInput) {

        imgSizeInput.addEventListener("change", () => {

            updateImageSize(
                activeImage,
                parseFloat(imgSizeInput.value),
                imgSizeInput
            );
        });
    }

    imgDecreaseBtn.addEventListener("click", () => {

        updateImageSize(
            activeImage,
            parseFloat(imgSizeInput.value) - 5,
            imgSizeInput
        );
    });

    imgIncreaseBtn.addEventListener("click", () => {

        updateImageSize(
            activeImage,
            parseFloat(imgSizeInput.value) + 5,
            imgSizeInput
        );
    });

    imgDoneBtn.addEventListener("click", () => {

        activeImage = clearImageSelection(editor, imageControls);
    });

    /* Submit */

    postForm.addEventListener("submit", (e) => {

        contentInput.value = editor.innerHTML;

        if (!contentInput.value.trim()) {

            e.preventDefault();
            alert("Post content cannot be empty!");
        }
    });

    document.getElementById("postForm").addEventListener("submit", () => {

        contentInput.value = editor.innerHTML;
    });

});