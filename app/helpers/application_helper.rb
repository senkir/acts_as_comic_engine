module ApplicationHelper
  #Helper method to generate a 14 character OID
  def create_oid
    UUID.generate_random.guid[0,13]
  end
end
