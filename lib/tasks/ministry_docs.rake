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
          ministrySpecifics: expect.specifics
        )
      end
      MinistryStrand.new(
        part: strand.part,
        title: strand.title,
        ministryOveralls: strand.expectations
      )
    end
    MinistryCourse.new(
      grade: course.grade,
      title: course.title,
      description: course.description,
      code: course.code,
      preReq: course.pre_req,
      level: course.level,
      ministryStrands: course.strands
    )
  end
  MinistryDoc.new(
    ministryCourses: parsed_data
  )
end
namespace :ministry_docs do
  desc "It parse from site 2007 math file"
  task parse_math_2007: :environment do
    parser = MinistryDocs::Math2007Parser.new
    doc = transform_to_doc(parser.parse_from_site)

    doc.year = '2007'

    doc.save!
  end

  desc "It parse from site 2005 math file"
  task parse_math_2005: :environment do
    parser = MinistryDocs::Math2005Parser.new
    doc = transform_to_doc(parser.parse_from_site)

    doc.year = '2005'

    doc.save!
  end

end
