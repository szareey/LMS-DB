# TODO: Not sure if resources really belong under teh MinistryDoc namespace.
# Works for convention I think though. Look into this.
class MinistryDoc::Resource < ActiveRecord::Base
  belongs_to :course
end