USE Universitate;

ALTER TABLE Student
ADD CONSTRAINT FK_Student_Grupa
FOREIGN KEY (GrupaId) REFERENCES Grupa(Id);

ALTER TABLE Student
ADD CONSTRAINT FK_Student_OrasResedinta
FOREIGN KEY (OrasResedintaId) REFERENCES Orase(Id);

ALTER TABLE Note
ADD CONSTRAINT FK_Note_Student
FOREIGN KEY (StudentId) REFERENCES Student(Id);

ALTER TABLE Note
ADD CONSTRAINT FK_Note_Materie
FOREIGN KEY (MaterieId) REFERENCES Materie(Id);