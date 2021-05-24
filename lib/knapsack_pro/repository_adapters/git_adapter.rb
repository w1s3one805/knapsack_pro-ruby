module KnapsackPro
  module RepositoryAdapters
    class GitAdapter < BaseAdapter
      def commit_hash
        `git -C "#{working_dir}" rev-parse HEAD`.strip
      end

      def branch
        `git -C "#{working_dir}" rev-parse --abbrev-ref HEAD`.strip
      end

      def branches
        str_branches = `git rev-parse --abbrev-ref --branches`
        str_branches.split("\n")
      end

      private

      def working_dir
        dir = KnapsackPro::Config::Env.project_dir

        if dir.to_s.include?('~')
          File.expand_path(dir)
        else
          dir
        end
      end
    end
  end
end
