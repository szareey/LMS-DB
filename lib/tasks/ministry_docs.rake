require 'ministry_docs'

def transform_to_doc(parsed_data)
  parsed_data.collect! do |course|
    course.strands.collect! do |strand|
      strand.expectations.collect! do |expect|
        expect.specifics.collect! do |specific|
          MinistrySpecific.new(specific.marshal_dump)
        end

        MinistryOverall.new(
          part: expect.part,
          description: expect.description,
          shorthand: expect.title,
          ministry_specifics: expect.specifics
        )
      end
      MinistryStrand.new(
        part: strand.part,
        title: strand.title,
        ministry_overalls: strand.expectations
      )
    end
    MinistryCourse.new(
      grade: course.grade,
      title: course.title,
      description: course.description,
      code: course.code,
      pre_req: course.pre_req,
      level: course.level,
      ministry_strands: course.strands
    )
  end
  MinistryDoc.new(
    ministry_courses: parsed_data
  )
end
namespace :ministry_docs do
  desc "It parse from site 2007 math file"
  task parse_math_2007: :environment do
    parser = MinistryDocs::Math2007Parser.new
    doc = transform_to_doc(parser.parse_from_site)

    doc.year = '2007'
    doc.title = 'The Ontario Curriculum, Grades 11 and 12: Mathematics, 2007'

    doc.save!
  end

  desc "It parse from site 2005 math file"
  task parse_math_2005: :environment do
    parser = MinistryDocs::Math2005Parser.new
    doc = transform_to_doc(parser.parse_from_site)

    doc.year = '2005'
    doc.title = 'The Ontario Curriculum, Grades 9 and 10: Mathematics, 2005'

    doc.save!
  end

end
