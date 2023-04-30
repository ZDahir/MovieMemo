//
//  MovieDetailView.swift
//  MovieMemo
//
//  Created by Zaid Dahir on 2023-02-28.
//

import SwiftUI
import AVKit
import AVFoundation

struct MovieDetailView: View {
    let movie: Movie
    @State private var audioRecordings: [URL] = []
    @State private var audioRecorder: AVAudioRecorder?

    var body: some View {
   
            HStack {

                Image("GodFather")
                VStack{
                    Text(movie.director)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    Text(movie.releaseDate)
                        .font(.title3)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 30)
                    Text(movie.synopsis)
                        .font(.body)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 20)
                    
                    
                }
                Spacer()
        }
        .navigationBarTitle(Text(movie.title), displayMode: .inline)
        if audioRecordings.isEmpty {
             Text("No audio recordings available")
                 .foregroundColor(.secondary)
         } else {
             List {
                 ForEach(audioRecordings, id: \.self) { recording in
                     Button(action: {

                         AudioPlayer.shared.playAudioFromURL(url: recording)
                     }, label: {
                         Text(recording.lastPathComponent)
                     })
                 }
             }
         }
         
         Spacer()

        Button(action: {

            if let recorder = audioRecorder {
                if recorder.isRecording {
                    stopRecording()
                } else {
                    startRecording()
                }
            } else {
                startRecording()
            }
        }) {
            if let recorder = audioRecorder, recorder.isRecording {
                ZStack{
                    Circle()
                        .fill(Color.red)
                        .frame(width: 70, height: 70)
                    Circle()
                        .stroke(Color.white, lineWidth: 6)
                        .frame(width: 85, height: 85)
                    
                }
               
                
                            } else {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 70, height: 70)
                                
            }
        }
        .padding()

         
     
    }

    private func startRecording() {
        let recordingSession = AVAudioSession.sharedInstance()

        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)

            let documentsDirectory = getDocumentsDirectory()
            let audioFilename = documentsDirectory.appendingPathComponent("\(UUID().uuidString).m4a")
            let settings = [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 12000,
                AVNumberOfChannelsKey: 1,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder?.record()
        } catch {
            print("Failed to record audio: \(error.localizedDescription)")
        }
    }

    private func stopRecording() {
        if let recorder = audioRecorder {
            recorder.stop()
            audioRecordings.append(recorder.url)
            audioRecorder = nil
        }
    }




    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
