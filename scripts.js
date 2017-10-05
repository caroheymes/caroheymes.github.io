// Bouton affichage element

document.getElementById('container').style.display = 'none';

function display() {
    document.getElementById('container').style.display = 'block';
    document.getElementById('display').style.display = 'none';
}
// la fonction recherche ne marche pas

function search()
{
    var recherche = document.getElementById('result').value;
    document.location.href="http://google.com/#q=" + result.value;
}


// Pop up site XXXXXXX

function popUp()
{
    setTimeout(function(){ alert("Hey le site xxxvidsxxx est trop bien. Viens dessus stp please"); }, 10000);

}

popUp();