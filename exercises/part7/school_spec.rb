require "./school"

describe Course do
  let(:course) { Course.new("Ruby 101", "CS", 4) }

  # Comment this line in when working on extras
  # let(:course) { Course.new("Ruby 101", "CS", 4, [:mon, :tue, :wed], 1) }

  describe "#initialize" do
    it "takes a name, department, and # of credits" do
      expect(course.name).to eq("Ruby 101")
      expect(course.department).to eq("CS")
      expect(course.credits).to eq(4)
    end

    it "initializes with an empty array of students" do
      expect(course.students).to eq([])
    end
  end

  describe "#add_student" do
    it "relies on Student#enroll" do
      student = double(:student)

      expect(student).to receive(:enroll).with(course)
      course.add_student(student)
    end

    it "doesn't add the student twice into its list of students" do
      student = Student.new("Johnny", "Rocket")
      course.add_student(student)

      expect(course.students).to eq([student])
    end
  end
end

describe Student do
  let(:student) { Student.new("Johnny", "Rocket") }

  describe "#initialize" do
    it "takes a first and last name" do
      expect(student.first_name).to eq("Johnny")
      expect(student.last_name).to eq("Rocket")
    end

    it "initializes courses to an empty array" do
      expect(student.courses).to eq([])
    end
  end

  describe "#name" do
    it "concatenates first and last name" do
      expect(student.name).to eq("Johnny Rocket")
    end
  end

  describe "#enroll" do
    let(:old_course) { double(:old_course) }
    let(:course_student) { double(:student) }
    let(:new_course) { double(:new_course, students: [course_student]) }

    before :each do
      student.courses.push(old_course)

      # used in conjunction with extension specs
      [old_course, new_course].each do |course|
        allow(course).to receive(:conflicts_with?)
      end

      student.enroll(new_course)
    end

    it "adds course to student's list of courses" do
      expect(student.courses).to eq([old_course, new_course])
    end

    it "updates the course's list of students" do
      expect(new_course.students).to eq([course_student, student])
    end

    it "ignores attempts to re-enroll into a course" do
      student.enroll(new_course)
      expect(student.courses).to eq([old_course, new_course])
    end
  end

  describe "#course_load" do
    it "returns a hash of department names pointing to # of credits" do
      ruby = double(:ruby_course, department: "CS", credits: 4)
      javascript = double(:js_course, department: "CS", credits: 4)
      drama = double(:drama_course, department: "Theatre", credits: 2)

      student.courses.push(ruby, javascript, drama)

      expect(student.course_load).to eq({
        "CS" => 8,
        "Theatre" => 2
      })
    end
  end
end

describe "Extras" do
  let(:ruby) { Course.new("Ruby 101", "CS", 4, [:mon, :tue, :wed], 1) }
  let(:python) { Course.new("Python", "CS", 4, [:wed, :thurs, :fri], 1) }
  let(:drama) { Course.new("Drama", "Theatre", 2, [:mon, :wed, :fri], 5) }

  describe "Course#initialize" do
    it "also takes a set of days and a time block" do
      expect(ruby.days).to eq([:mon, :tue, :wed])
      expect(ruby.time_block).to eq(1)
    end
  end

  describe "Course#conflicts_with?" do
    it "returns true if time block conflicts on the same day" do
      expect(ruby.conflicts_with?(python)).to be true
    end

    it "returns false if no conflicts" do
      expect(ruby.conflicts_with?(drama)).to be false
    end

    it "returns false if same set of days but different time blocks" do
      js = Course.new("JavaScript", "CS", 4, [:mon, :tue, :wed], 3)
      expect(ruby.conflicts_with?(js)).to be false
    end

    it "returns false if same time block but different days" do
      ruby2 = Course.new("Ruby 102", "CS", 4, [:thurs, :fri], 1)
      expect(ruby.conflicts_with?(ruby2)).to be false
    end
  end

  describe "Student#enroll" do
    it "raises an error if course conflicts with already enrolled course" do
      student = Student.new("Johnny", "Rocket")
      student.enroll(drama)
      student.enroll(ruby)

      expect { student.enroll(python) }.to raise_error
    end
  end
end
