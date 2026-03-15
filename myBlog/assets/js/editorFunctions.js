/* ===============================
   Editor Utility Functions
================================ */

/* -------- Text Alignment -------- */
export function applyAlignment(command) {
    document.execCommand(command, false, null);
}

/* -------- Image Upload -------- */
export function uploadImage(file, editor) {
    const formData = new FormData();
    formData.append('image', file);

    fetch('servers/upload_image.php', {
        method: 'POST',
        body: formData
    })
        .then(res => res.json())
        .then(data => {
            if (!data.success || !data.url) {
                alert('Image upload failed.');
                return;
            }

            const img = document.createElement('img');
            img.src = data.url;
            img.style.width = '20%';
            img.style.height = 'auto';
            img.dataset.sizePercent = 20;
            img.draggable = false;

            editor.appendChild(img);
        })
        .catch(() => alert('Image upload failed.'));
}

/* -------- Image Size Handling -------- */
export function updateImageSize(img, percent, inputEl) {
    if (!img) return;

    percent = Math.min(Math.max(percent, 5), 200);
    img.style.width = percent + '%';
    img.dataset.sizePercent = percent;

    if (inputEl) {
        inputEl.value = percent;
    }
}

/* -------- Image Selection -------- */
export function selectImage(target, editor, controls, sizeInput) {
    document.querySelectorAll('#editor img').forEach(img =>
        img.classList.remove('selected')
    );

    target.classList.add('selected');

    const percent = parseFloat(target.dataset.sizePercent) || 20;
    sizeInput.value = percent;
    controls.hidden = false;

    return target;
}

/* -------- Clear Image Selection -------- */
export function clearImageSelection(editor, controls) {
    document.querySelectorAll('#editor img').forEach(img =>
        img.classList.remove('selected')
    );
    controls.hidden = true;
    return null;
}