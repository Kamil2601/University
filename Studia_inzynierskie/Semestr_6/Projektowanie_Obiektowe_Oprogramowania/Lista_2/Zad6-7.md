Zadanie 6 cd
Czy na podstawie kodu można narysować jednoznaczny i precyzyjny diagram?
Tak


--------------------------------------------

Zadanie 7s


class Student {
    Course[] getCourses() {
        return courses;
    }
}

class UsosWebPage {
    void show() {
        pageLayout = GradeController.getStudentGradeInfo();
    }
}

class GradeController {
    static PageLayout getStudentGradeInfo() {
        var studentCourses = student.getCourses();

        foreach (var course in studentCourses) {
            mark = course.getMark(student);
        }

        return pageLayout;
    }
}

class Course {
    Mark getValue() {
    }

    Mark getMark(Student student) {
        getValue();
    }
}


Czy na podstawie diagramu można napisać jednoznaczny i precyzyjny kod?

Nie, bo diagram pomija rzeczy takie jak typy i dokładną implementację wywoływanych metod.
