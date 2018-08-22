$(document).on 'turbolinks:load', ->
  $('sentence-tags').tagit({
    fieldName:   'concept_list'
    singleField: true
  });
  $('#sentence-tags').tagit()
  concept_string = $("#concept_hidden").val()
  try
    concept_list = concept_string.split(',')
    for tag in concept_list
      $('#sentence-tags').tagit 'createTag', tag
  catch error

var concept_area = document.getElementById('concept-area');
var concept_btn = document.getElementById('concept-btn');

//ボタンをクリックしたら、カンマごとに配列へ格納する
concept_btn.addEventListener('click', function() {
    console.log( concept_area.value.split(",") );
})