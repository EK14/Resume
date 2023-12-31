# Resume
The project is a test task that I was given to select for an internship at "[Surf](https://surf.ru/)".

## Screen Composition
<img width="178" height="350" alt="Снимок_экрана_2023-08-09_в_18 22 09-removebg-preview" src="https://github.com/EK14/Resume/assets/75206974/2bc8fcfb-0772-4ce5-be2c-8acd12e17998">
<img width="178" height="350" alt="Снимок_экрана_2023-08-09_в_18 22 21-removebg-preview" src="https://github.com/EK14/Resume/assets/75206974/deb325b1-9c11-4698-a6b3-885622ba9450">
<img width="178" height="350" alt="Снимок_экрана_2023-08-09_в_18 23 15-removebg-preview" src="https://github.com/EK14/Resume/assets/75206974/8a5a11a7-b1f6-4b7c-884d-d0796982cea1">
<img width="178" height="350" alt="Снимок_экрана_2023-08-09_в_18 23 29-removebg-preview" src="https://github.com/EK14/Resume/assets/75206974/db1aa2c1-111e-4494-91b3-76127ef472a2">

## Description
[Design template](https://www.figma.com/file/xfRZ6MHiLNO9BSUN9uVhnN/iOS-%D0%97%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D1%8F?type=design&node-id=1-108&mode=design&t=qgXnoInFfN3C86nH-0)

The application contains the functionality of a mini-resume, the “My Skills” block is editable, the rest is hardcode. The screen can scroll.
The development was carried out on UIKit without third-party libraries, only by native means.

1) Heading "Profile".
2) User photo.
3) The motto of the user, brief information. The label is limited to two lines, long text is cut off with three dots.
4) The user's place of residence. Limited to one line, long text is truncated with ellipsis. 
5) The heading “My Skills” and the edit mode button. Pencil icon to enter edit mode, check mark icon to save changes.
6) Block my skills. Can be edited by the user. Limit cell height to one line. The maximum cell width is limited by the screen width minus the side padding. The number of cells (skills) in the section is not limited. If the text does not fit, abbreviate with three dots.
In edit mode, a cross is added to each cell with a skill, by clicking on which, the skill is deleted. A cell with a plus sign is also added, by clicking on which a new skill is added. The skill is entered through the native Alert View.
7) About Me. Text block. The number of lines is not limited.
