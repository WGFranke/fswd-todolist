import $ from 'jquery';

import {
  indexTasks,
  postTask,
} from "./requests.js";

// document ready
$(document).ready(function() {
  indexTasks(function(response) {
    console.log('indexTasks response', response)

    var htmlString = response.tasks.map(function(task) {
      return "<div class='col-12 mb-3 p-2 border rounded task' data-id='" + task.id + "'> \
        " + task.content + "\
        </div>";
    });

    $("#todo-list").html(htmlString);
  });
});
