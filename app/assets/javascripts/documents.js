

function Document(document, user_id) {
	this.user_id = user_id
    this.id = document.id
    this.title = document.title
    this.desc = document.description
    this.type = document.doctype
    this.url = document.url
    this.created_at = document.created_at
    this.updated_at = document.updated_at
}

Document.prototype.formatIndex = function() {
    let documentHTML = `<h3><a href="/users/${this.user_id}/documents/${this.id}">${this.title}</a></h3>`
    return documentHTML
}


Document.prototype.formatSpan = function() {
    let spanItem = `<h3 class="w3-large">
        <i class="material-icons w3-large doc" id=${this.id} data-id='${this.id}'>keyboard_arrow_down</i>
        <a href="/users/${this.user_id}/documents/${this.id}">${this.title}</a>
        </h3><span id='${this.id}' class='document remove-document ${this.id}' data-id='${this.id}' style="display: none;" ><p class='remove'>Remove</p></span><br>`
    return spanItem
}





