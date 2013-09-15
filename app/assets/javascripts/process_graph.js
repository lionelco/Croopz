// Occurrence feature : set the Defect id in the defect_id of suggestion record

function validateform(){
   var selected_value = document.getElementById("impact_value").value;
   document.getElementById("occurrence_defect_id").value = selected_value;
}

