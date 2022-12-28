package com.yumyum.inmat

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.yumyum.inmat.databinding.ActivitySecondBinding

class SecondActivity : AppCompatActivity() {
    private lateinit var binding: ActivitySecondBinding
    private var num = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySecondBinding.inflate(layoutInflater)
        setContentView(binding.root)
        doIncrement()

    }

    private fun doIncrement() {
        binding.incrementButton.setOnClickListener {
            num++
            binding.numTextView.text=num.toString()

        }
    }

}