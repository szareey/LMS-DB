require 'ministry_docs'

def transform_to_doc(parsed_data)
  parsed_data.courses.collect! do |course|
    course.strands.collect! do |strand|
      strand.expectations.collect! do |expect|
        expect.specifics.collect! do |specific|
          MinistryDoc::Specific.new(specific.marshal_dump)
        end

        MinistryDoc::Overall.new(
          part: expect.part,
          description: expect.description,
          shorthand: expect.title,
          ministry_specifics: expect.specifics
        )
      end
      MinistryDoc::Strand.new(
        part: strand.part,
        title: strand.title,
        ministry_overalls: strand.expectations
      )
    end
    MinistryDoc::Course.new(
      grade: course.grade,
      title: course.title,
      description: course.description,
      code: course.code,
      pre_req: course.pre_req,
      level: course.level,
      ministry_strands: course.strands
    )
  end
  grades = [9, 10, 11, 12].collect do |grade|
    {"grade#{grade}" => parsed_data.grades.include?(grade)}
  end

  MinistryDoc.new({
    ministry_courses: parsed_data.courses,
    title: parsed_data.title,
    subject: parsed_data.subject,
    year: parsed_data.year,
    'URLpdf' => parsed_data.pdf_url,
    province: parsed_data.province
  }.merge(grades.reduce Hash.new, :merge))
end

namespace :ministry_docs do
  desc "It parse from site 2007 math file"
  task parse_math_2007: :environment do
    parser = MinistryDocs::Math2007Parser.new
    doc = transform_to_doc(parser.parse_from_site)
    doc.save!
  end

  desc "It parse from site 2005 math file"
  task parse_math_2005: :environment do
    parser = MinistryDocs::Math2005Parser.new
    doc = transform_to_doc(parser.parse_from_site)
    doc.save!
  end

end
