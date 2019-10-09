---
---
$(function() {
    $('#file-input').change(loadFile);
    $('#url-form').submit(loadURL);
    $('#url-form a').click(fillUrlInput);
    $('#url-input').keyup(checkIfRemoveErrors);
});

// Respond to a user choosing a file to upload. If successful,
// send the user to the transformation page.
function loadFile() {
    resetErrors();
    $(this).blur();
    var myFile = this.files[0];
    readXML(myFile).then(function(fileText) {
        // We could use the filename as the identifier. However
        // multiple clients could have conflicts on filenames for
        // files that are not identical to each other. This has the
        // potential to be confusing if URLs are copied/pasted
        // between users/sessions.
        var newId = uniqueId();
        sessionStorage.setItem(newId, fileText);
        sessionStorage.setItem(newId+'_name', myFile.name);

        location.href = '{{ site.github.url }}/transform.html?h=' + newId;
    }).catch(function(err) {
        $('#file-error').text(err);
        $('#file-input + label').addClass('error');
        console.log(err);
    });
}

// Enables Drag & Drop Functionality
var $form = $('.dragndrop');
$form.on('drag dragstart dragend dragover dragenter dragleave drop', function(e) {
    e.preventDefault();
    e.stopPropagation();
})
.on('dragover dragenter', function() {
    $form.addClass('is-dragover');
})
.on('dragleave dragend drop', function() {
    $form.removeClass('is-dragover');
})
.on('drop', function(e) {
    resetErrors();
    droppedFiles = e.originalEvent.dataTransfer.files[0];
    readXML(myFile).then(function(fileText) {
        // We could use the filename as the identifier. However
        // multiple clients could have conflicts on filenames for
        // files that are not identical to each other. This has the
        // potential to be confusing if URLs are copied/pasted
        // between users/sessions.
        var newId = uniqueId();
        sessionStorage.setItem(newId, fileText);
        sessionStorage.setItem(newId+'_name', myFile.name);

        location.href = '{{ site.github.url }}/transform.html?h=' + newId;
    }).catch(function(err) {
        $('#file-error').text(err);
        $('#file-input + label').addClass('error');
        console.log(err);
    });
});

// A Promise that reads a file from the user and provides the string
// text on success.
function readXML(file) {
    return new Promise (function(resolve, reject) {
        if(!file.type.match(/.*xml/)) {
            reject(Error('Filetype not supported. Please select an XML file.'));
        } else {
            var reader = new FileReader();
            reader.onload = function(e) {
                resolve(e.target.result);
            };
            reader.onerror = function() {
                reject(Error('There was a problem loading the file.'));
            }
            reader.readAsText(file);
        }
    });
}

// Respond to a user choosing a URL to access. If successful,
// send the user to the transformation page.
function loadURL(e) {
    e.preventDefault();
    resetErrors();
    var url = $('#url-input').val();
    getContentType(url).then(function(contentType) {
        if(contentType.match(/.*xml/)) {
            location.href = '{{ site.github.url }}/transform.html?f=' + encodeURIComponent(url);
        } else {
            throw Error('The URL provided doesn\'t appear to be an IRS XML e-file document.');
        }
    }).catch(function(error) {
        $('#url-error').text(error);
        $('#url-input').addClass('error');
        console.log(error);
    });
}

// A Promise that checks the Content-Type of a request
function getContentType(url) {
    return new Promise (function(resolve, reject) {
        if(!url) {
            reject(Error('No file was requested.'));
            return;
        }

        var request = new XMLHttpRequest();
        request.open('HEAD', url);
        request.onload = function() {
            if(request.status === 200) {
                resolve(request.getResponseHeader('Content-Type'));
            } else {
                reject(Error('Error Code: ' + request.status + ' (' + request.statusText + ')'));
            }
        };
        request.onerror = function() {
            reject(Error('There was a network error.'));
        };
        request.send();
    });
}

// Pre-load the search box with a URL that will work
function fillUrlInput(e) {
    e.preventDefault();
    $('#url-input').val(e.target.href);
    $('#url-input').focus();
}

// Remove user errors alerts
function resetErrors() {
    $('#url-error, #file-error').empty();
    $('#url-input').removeClass('error');
    $('#file-input + label').removeClass('error');
}

// Event handler for resetting errors
function checkIfRemoveErrors() {
    if(!this.value) {
        resetErrors();
    }
}

// Generate unique IDs for use as pseudo-private/protected names.
// There are two goals for this function:
//
// * Provide a way to generate a string guaranteed to be unique when
//   compared to other strings generated by this function.
// * Make the string complex enough that it is highly unlikely to be
//   accidentally duplicated by hand (this is key if you're using
//   `ID` as a private/protected name on an object).
//
// via https://gist.github.com/gordonbrander/2230317
function uniqueId() {
  // Math.random should be unique because of its seeding algorithm.
  // Convert it to base 36 (numbers + letters), and grab the first 9
  // characters after the decimal.
  return '_' + Math.random().toString(36).substr(2, 9);
};
