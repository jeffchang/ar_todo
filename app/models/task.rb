class Task < ActiveRecord::Base

  belongs_to :list

  class << self

    def list(list_num, nil_num)
      puts "Tasks:"
      self.where('list_id = ?', list_num).each_with_index do |task, index|
        puts "#{((index + 1).to_s + ".").ljust(5)}[#{task.status == "complete" ? "X" : " "}] #{task.description}"
      end
    end

    def add(list_num, task)
      self.create({description: task, status: "incomplete"})
      puts "You've just created the following task: #{task}"
    end

    def delete(list_num, task_num)
      raise "The list doesn't have a ##{task_num}, sorry." if task_num.to_i > self.all.count || task_num.to_i < 1
      task = self.all[task_num.to_i - 1]
      puts "You've just destroyed the following task: #{task.description}  Lazy bum!!"
      task.destroy
    end

    def complete(list_num, task_num)
      raise "The list doesn't have a ##{task_num}, sorry." if task_num.to_i > self.all.count || task_num.to_i < 1
      task, task.status = self.all[task_num.to_i - 1], "complete"
      task.save
      puts "You've just completed the following task: #{task.description}  Congrats!!"
    end
  
    def determine_list(p_1, p_2)
      #database query to find active_list
    end

  end
end
