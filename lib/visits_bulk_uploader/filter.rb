module VisitsBulkUploader
  # Takes in params for Visit and some filter arguments
  # Compares them to each other to decide whether to create this Visit or not
  # Available filters: min_sum, max_sum, min_end_at, max_end_at
  class Filter
    def initialize(params, filters = {})
      @params = params
      @filters = filters
    end

    def passes?
      return false if @filters[:min_sum] && @params[:sum] < @filters[:min_sum]

      return false if @filters[:max_sum] && @params[:sum] > @filters[:max_sum]

      return false if @filters[:min_end_at] &&
                      @params[:end_at] < @filters[:min_end_at]

      return false if @filters[:max_end_at] &&
                      @params[:end_at] > @filters[:max_end_at]

      true
    end
  end
end
